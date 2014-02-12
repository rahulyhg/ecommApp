<?php

class page_ecommApp_page_owner_brand extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Brand Setting <small>Update your Brand settings</small>');
		$crud = $this->add('CRUD');
		$crud->setModel('ecommApp/Model_Brand');
		
		// if($form->isSubmitted()){
		// 	$form->update();
		// 	$form->js()->univ()->successMessage("done")->execute();
		// }

	}
}