<?php

class page_ecommApp_page_owner_products extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Product Setting <small>Update your Product settings</small>');
		$form = $this->add('Form');
		$form->setModel('ecommApp/Model_Product');
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			$form->update();
			$form->js()->univ()->successMessage('Product Settings Updated')->execute();
		}

	}
}
