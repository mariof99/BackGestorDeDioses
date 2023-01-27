<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Humano extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_humano';

    protected $table = 'humanos';
    protected $fillable =
    [
    'id_humano',
    'destino',
    'id_dios',
    'cielo_infierno'
    ];

    function dios()
    {
        return $this->belongsTo(User::class, 'id_dios', 'id');
    }

    function pruebas() {
        return $this->belongsToMany(Prueba::class, 'humano_prueba', 'id_humano', 'id_prueba');
    }

}
