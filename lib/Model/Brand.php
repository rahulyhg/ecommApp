<?php

namespace ecommApp;

class Model_Brand extends \Model_Table{
	public $table='ecommApp_Brand';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name')->Caption('Brand Name');
		$this->addField('image')->display(array('form'=>'ElImage'));
		$this->addField('description')->type('text')->Caption('Brand Description');
		$this->addField('Meta_keyword')->type('text')->Caption('Meta KeyWord');
		$this->addField('meta_description')->type('text')->Caption('Meta Description');

		$this->hasMany('ecommApp/Products','brand_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}