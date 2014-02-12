<?php

class page_ecommApp_page_owner_products extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Product Setting <small>Update your Product settings</small>');
		$crud= $this->add('CRUD');
		$crud->setModel('ecommApp/Model_Product');
		$crud->addRef('ecommApp/ProductDetails',array('label'=>'Details'));
		$crud->addRef('ecommApp/CustomFields',array('label'=>'Choices'));

	}
}
