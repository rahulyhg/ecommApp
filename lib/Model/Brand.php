<?php

namespace ecommApp;

class Model_Brand extends \Model_Table{
	public $table='ecommApp_Brand';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name');

		$this->hasMany('ecommApp/Products','brand_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}