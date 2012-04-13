#include <irrlicht.h>

int main()
{
    irr::IrrlichtDevice *device =
        irr::createDevice(irr::video::EDT_SOFTWARE, irr::core::dimension2d<irr::u32>(1280, 720), 32,
                          false, false, false, 0);

	if (!device)
		return 1;

	device->setWindowCaption(L"CrowGame");

    irr::video::IVideoDriver* driver = device->getVideoDriver();
    irr::scene::ISceneManager* smgr = device->getSceneManager();

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
		node->setMaterialTexture( 0, driver->getTexture("../../media/sydney.bmp") );
	}*/

	smgr->addCameraSceneNode(0, irr::core::vector3df(0,30,-40), irr::core::vector3df(0,5,0));

	while(device->run())
	{
		driver->beginScene(true, true, irr::video::SColor(255,100,101,140));

		smgr->drawAll();

		driver->endScene();
	}

	device->drop();

	return 0;
}
