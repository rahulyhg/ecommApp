<?php

class page_ecommApp_page_owner_categories extends page_ecommApp_page_owner_main{

	function init(){
		parent::init();

		$this->add('H1')->setHTML('Category Setting <small>Update your Category settings</small>');
		$form = $this->add('Form');
		$form->setModel('ecommApp/Model_Category');
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			$form->update();
			$form->js()->univ()->successMessage('Category Settings Updated')->execute();
		}

	}
}
