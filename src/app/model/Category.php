<?php

namespace app\model;

class Categorie extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'categorie';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function Products()
    {
        return $this->hasMany(Product::class, 'id_categorie');
    }
}
