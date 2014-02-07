<?php

namespace ecommApp;

class View_Server_Products extends \View{
	function init(){
		parent::init();
		$product_view=$this->add('ecommApp/View_Lister_Product');
		$this->api->stickyGET($product_view->name."_paginator_skip");
		
		$product_view->setModel('ecommApp/Model_Product');
		$paginator = $product_view->add('Paginator');
		$paginator->ipp(2);

	}
}