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
		
		$this->addCondition('shop_id',$this->add('ecommApp/Model_Shop')->loadAny()->get('id'));

		$this->addHook('beforeDelete',$this);
		$this->addHook('beforeSave',$this);
		
		$this->add('dynamic_model/Controller_AutoCreator');
	}
		function beforeDelete(){
			if($this->ref('ecommApp/Product')->count()->getOne() >0)
			throw new \Exception("You can not Delete Category It Contain Product");
		}

		function beforeSave(){
			$old_category=$this->add('ecommApp/Model_Category');
			$old_category->addCondition('name',$this['name']);
			if($this->loaded())
				$old_category->addCondition('id','<>',$this->id);

			$old_category->tryLoadAny();
			if($old_category->loaded())
				throw new \Exception("this Category Name Is alredy Exits ");
				
		}
}		

