<?php

class page_ecommApp_page_owner_shopsettings extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Shop Settings <small>Update your shop settings first</small>');
		$form = $this->add('Form');
		$form->setModel($this->add('ecommApp/Model_Shop')->tryLoadAny());
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			$form->update();
			$form->js()->univ()->successMessage('Shop Settings Updated')->execute();
		}
	}
	
}