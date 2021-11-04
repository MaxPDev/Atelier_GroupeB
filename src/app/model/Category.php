<?php

namespace app\model;

class Category extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'category';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function Products()
    {
        return $this->hasMany(Product::class, 'id_categorie');
    }
}
