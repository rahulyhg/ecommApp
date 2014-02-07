<?php

namespace ecommApp;

class View_AddToCart extends \View{
	function init(){
		parent::init();
	}

	function setModel($product){
		$form = $this->add('Form',array('name'=>'adc_'.$product->id));
		$form->addField('line','qty');
		$form->addField('line','product')->set($product['name']);
		foreach ($this->add('ecommApp/Model_CustomFields')->addCondition('product_id',$product->id) as $choice) {
			$values_arr = explode(",", $choice['value']);
			$value_list =array();
			foreach ($values_arr as $value) {
				$value_list[trim($value)]=trim($value);
			}
			$form->addField('DropDown',$choice['name'])->setValueList($value_list);
	
		}

		if($form->isSubmitted()){
			$this->api->stickyGET($form->owner->owner->name."_paginator_skip");
			$old_cart=$this->api->recall('ecommApp_cart',array());
			$old_cart[]=$form['product'];
			$this->api->memorize('ecommApp_cart',$old_cart);
			$form->js()->_selector('.ecommApp-cart')->trigger('reload')->execute();
		}

		parent::setModel($product);
	}
}