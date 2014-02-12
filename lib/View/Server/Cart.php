<?php

namespace ecommApp;

class View_Server_Cart extends \View{
	function init(){
		parent::init();


		foreach ($this->api->recall('ecommApp_cart',array()) as $product) {
			$this->add('View')->set($product);
			
		}
		$this->addClass('ecommApp-cart');
		$this->js('reload')->reload();
		
	}
}