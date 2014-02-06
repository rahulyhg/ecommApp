<?php

namespace ecommApp;

class Model_Category extends \Model_Table{
	public $table='ecommApp_Category';

	function init(){
		parent::init();

		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name')->Caption('Category Name');
		$this->addField('alias')->Caption('Categories Alias');
		$this->addField('image')->display(array('form'=>'ElImage'));
		$this->addField('is_active')->type('boolean')->Caption('Publish');
		$this->addField('description')->type('text')->Caption('Category Description');
		$this->addField('meta_keyword')->type('text')->Caption('Meta Keyword');
		$this->addField('meta_description')->type('text')->Caption('Meta Description');
		
		$this->hasMany('ecommApp/Category','category_id');
		
		// $this->addHook('beforeDelete',$this);
		
		// function beforeDelete(){
		// 	if($this['name'] > 0 OR $this->ref('Product')->count()->getOne()){
		// 		throw $this->exception('can not be deleted');
		// 	}
		
		
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}