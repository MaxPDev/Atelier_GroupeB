<?php

namespace app\model;

class Product extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'product';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function producer()
    {
        return $this->belongsTo(Producer::class, 'id_producer');
    }

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'id_categorie');
    }
}
