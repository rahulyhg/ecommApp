<?php

class page_ecommApp_page_owner_brand extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Brand Setting <small>Update your Brand settings</small>');
		$form = $this->add('Form');
		$form->setModel('ecommApp/Model_Brand');
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			$form->update();
			$form->js()->univ()->successMessage("done")->execute();
		}

	}
}