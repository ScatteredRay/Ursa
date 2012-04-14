#include <irrlicht.h>

extern "C"
{
#include <lua.h>
#include <lauxlib.h>
}

#include <vector>

#ifdef __APPLE__
#include "strings.h"
int stricmp(const char* l, const char* r)
{
    return strcasecmp(l, r);
}
#endif

#define UDebugF printf

// Debug or non-shipping release builds.
#define VERIFY 1

char* string_new(const char* str)
{
    char* newstr = new char[strlen(str) + 1];
    strcpy(newstr, str);
    return newstr;
}

char* find_resource_location(const char* group, const char* name, const char* type)
{
    const char* project = "editor";
    //TODO: Build this helper func!
    size_t len = snprintf(0, 0, "../data/%s/%s/%s.%s", project, group, name, type) + 1;
    char* path = new char[len];
    snprintf(path, len, "../data/%s/%s/%s.%s", project, group, name, type);

    return path;
}

struct Resource
{
    char* group;
    char* name;
    char* type;
    char* location;
    Resource(const char* _group, const char* _name, const char* _type)
    {
        group = string_new(_group);
        name = string_new(_name);
        type = string_new(_type);
        location = find_resource_location(group, name, type);
    }
    ~Resource()
    {
        delete[] group;
        delete[] name;
        delete[] type;
        delete[] location;
    }
};

class ResourceManager
{
    std::vector<Resource*> resources;
public:
    ~ResourceManager()
    {
        for(std::vector<Resource*>::iterator it = resources.begin(); it != resources.end(); it++)
        {
            delete (*it);
        }
    }
    // Return the default resource for the given type, make it obvious.
    Resource* getDefaultResource(const char* type)
    {
        //TODO: Implement.
        return NULL;
    }

    // Locates the resource given a group, name, and type. Resources are case sensitive.
    Resource* findResource(const char* group, const char* name, const char* type)
    {
        // We *need* a much faster way to find resources.
        for(std::vector<Resource*>::iterator it = resources.begin(); it != resources.end(); it++)
        {
            if(strcmp(name, (*it)->name) == 0 &&
               strcmp(group, (*it)->group) == 0 &&
               strcmp(type, (*it)->type) == 0)
            {
                return *it;
            }
#if VERIFY
            // We should consider returning the found resource in shipping builds.
            else if(stricmp(name, (*it)->name) == 0 &&
                    stricmp(group, (*it)->group) == 0 &&
                    stricmp(type, (*it)->type) == 0)
            {
                UDebugF("Resource (%s:%s:%s) found already loaded with mismatching case (%s:%s:%s)",
                        group, name, type,
                        (*it)->group, (*it)->name, (*it)->type);

                return getDefaultResource(type);
            }
#endif
        }


        Resource* res = new Resource(group, name, type);
        resources.push_back(res);
        return res;
    }
};

const char* get_resource_path(ResourceManager* mgr, const char* group, const char* name, const char* type)
{
    Resource* res = mgr->findResource(group, name, type);
    return res->location;
}

int main()
{
    irr::IrrlichtDevice *device =
        irr::createDevice(irr::video::EDT_SOFTWARE, irr::core::dimension2d<irr::u32>(1280, 720), 32,
                          false, false, false, 0);

    if (!device)
        return 1;

    ResourceManager* resource_manager = new ResourceManager();

    device->setWindowCaption(L"UrEd");

    irr::video::IVideoDriver* driver = device->getVideoDriver();
    irr::scene::ISceneManager* smgr = device->getSceneManager();

    lua_State* lua = luaL_newstate();

    luaL_dofile(lua, get_resource_path(resource_manager, "script", "editor", "lua"));

    /*IAnimatedMesh* mesh = smgr->getMesh("../../media/sydney.md2");
    if (!mesh)
    {
        device->drop();
        return 1;
    }
    IAnimatedMeshSceneNode* node = smgr->addAnimatedMeshSceneNode( mesh );

    if (node)
    {
        node->setMaterialFlag(EMF_LIGHTING, false);
        node->setMD2Animation(scene::EMAT_STAND);
        node->setMaterialTexture( 0, d  river->getTexture("../../media/sydney.bmp") );
    }*/

    smgr->addCameraSceneNode(0, irr::core::vector3df(0,30,-40), irr::core::vector3df(0,5,0));

    while(device->run())
    {
        driver->beginScene(true, true, irr::video::SColor(255,100,101,140));

        smgr->drawAll();

        driver->endScene();
    }

    lua_close(lua);

    delete resource_manager;

    device->drop();

    return 0;
}
