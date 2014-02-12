<?php

class page_ecommApp_page_owner_orders extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Order List ');
		$crud=$this->add('CRUD',array('allow_add'=>false));
		$shop=$this->add('ecommApp/Model_Shop')->loadAny();
		$crud->setModel($shop->ref('ecommApp/Order'));
		
	}
	
}