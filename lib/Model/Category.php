<?php

namespace ecommApp;

class Model_Category extends \Model_Table{
	public $table='ecommApp_Category';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name');

		$this->hasMany('ecommApp/Product','category_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}