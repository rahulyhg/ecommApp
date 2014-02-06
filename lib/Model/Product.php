<?php

namespace ecommApp;

class Model_Product extends \Model_Table{
	public $table='ecommApp_Product';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Category','category_id');
		$this->hasOne('ecommApp/Brand','brand_id');
		$this->addField('name');

		$this->hasMany('ecommApp/CustomFields','product_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}