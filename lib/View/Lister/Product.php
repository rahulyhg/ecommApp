<?php

namespace ecommApp;

class View_Lister_Product extends \CompleteLister{

	function formatRow(){
		$details = $this->add('ecommApp/View_Lister_ProductDetails',null,'product_details');
		$details->setModel($this->add('ecommApp/Model_ProductDetails')->addCondition('product_id',$this->model->id));
		$this->current_row_html['product_details'] = $details->getHTML();
		$details->destroy();

		$cart = $this->add('ecommApp/View_AddToCart',null,'add_to_cart_form');
		$cart->setModel($this->model);
		$this->current_row_html['add_to_cart_form']=$cart->getHTML();
		$cart->destroy();
	}
	
	function defaultTemplate(){
		$l=$this->api->locate('addons',__NAMESPACE__, 'location');
		$this->api->pathfinder->addLocation(
			$this->api->locate('addons',__NAMESPACE__),
			array(
		  		'template'=>'templates',
		  		'css'=>'templates/css',
		  		'js'=>'templates/js'
				)
			)->setParent($l);

		return array('view/ecommApp-productlist');
	}

}