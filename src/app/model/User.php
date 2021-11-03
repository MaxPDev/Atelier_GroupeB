<?php

namespace app\model;

class User extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'user';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function manager()
    {
        return $this->hasMany(Manager::class, 'user_id');
    }

    public function producer()
    {
        return $this->hasMany(Producer::class, 'user_id');
    }
}
