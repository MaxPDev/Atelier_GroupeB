<?php

namespace app\model;

class User extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'user';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function manager()
    {
        return $this->hasOne(Manager::class, 'id_user');
    }

    public function producer()
    {
        return $this->hasOne(Producer::class, 'id_user');
    }
}
