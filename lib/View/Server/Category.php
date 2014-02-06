<?php

namespace ecommApp;

class View_Server_Category extends \View{
	function init(){
		parent::init();

		$this->add('ecommApp/View_Lister_Category')->setModel('ecommApp/Model_Category');
	}
}