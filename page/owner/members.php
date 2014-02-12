<?php

class page_ecommApp_page_owner_members extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$shop=$this->add('ecommApp/Model_Shop')->loadAny();
		$this->add('H1')->setHTML('Members List');
		$crud=$this->add('CRUD',array('allow_add'=>false));
		$crud->setModel($shop->ref('ecommApp/Member'));
		
	}
	
}