<?php

namespace ecommApp;

class Model_ProductDetails extends \Model_Table {
	var $table= "ecommApp_ProductDetails";
	function init(){
		parent::init();

		$this->hasOne('ecommApp/Product','product_id');
		$this->addField('name')->caption('Parameter');
		$this->addField('value');

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}