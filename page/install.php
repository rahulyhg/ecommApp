<?php

class page_ecommApp_page_install extends page_componentBase_page_install {
	function init(){
		parent::init();
		
		$this->install();
		$this->add('ecommApp/Model_Shop')->save();
	}
}