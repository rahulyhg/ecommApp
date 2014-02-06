<?php

namespace ecommApp;

class View_Server_Products extends \View{
	function init(){
		parent::init();

		$this->add('ecommApp/View_Lister_Product')->setModel('ecommApp/Model_Product');
	}
}