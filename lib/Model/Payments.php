<?php

namespace ecommApp;

class Model_Payments extends \Model_Table{
	public $table='ecommApp_Payments';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Order','order_id');
		$this->addField('name');

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}