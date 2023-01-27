<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('humano_prueba', function (Blueprint $table) {
            $table->unsignedBigInteger('id_humano')->references('id')->on('users')->delete('cascade');
            $table->unsignedBigInteger('id_prueba')->references('id')->on('pruebas')->delete('cascade');
            $table->enum('tipo', ['puntual', 'eleccion', 'respLibre', 'valoracion'])->nullable();
            $table->boolean('superada')->nullable();
            $table->primary(['id_humano', 'id_prueba']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('humano_prueba');
    }
};
