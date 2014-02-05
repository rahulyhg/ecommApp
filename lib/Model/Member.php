<?php

namespace ecommApp;

class Model_Member extends \Model_Table{
	public $table='ecommApp_Member';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name');
		$this->addField('username');
		$this->addField('password');

		$this->hasMany('ecommApp/Order','member_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}