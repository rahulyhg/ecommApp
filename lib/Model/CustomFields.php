<?php

namespace ecommApp;

class Model_CustomFields extends \Model_Table{
	public $table='ecommApp_CustomFields';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Product','product_id');
		$this->addField('name')->caption('Field Name');
		$this->addField('value')->hint('Comma Separated Values i.e. Red, Green, Blue');

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}