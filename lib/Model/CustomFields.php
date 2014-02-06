<?php

namespace ecommApp;

class Model_CustomFields extends \Model_Table{
	public $table='ecommApp_CustomFields';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Product','product_id');
		$this->addField('name')->caption('Field Name');
		$this->addField('value');
		$this->addField('is_dropdown')->type("boolean")->defaultValue(false);

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}