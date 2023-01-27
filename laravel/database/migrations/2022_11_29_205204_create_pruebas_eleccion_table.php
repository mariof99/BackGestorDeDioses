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
        Schema::create('pruebas_eleccion', function (Blueprint $table) {
            $table->unsignedBigInteger('id')->primary()->references('id')->on('pruebas_oraculo')->delete('cascade');
            $table->string('respuesta_correcta');
            $table->string('respuesta_incorrecta');
            $table->enum('atributo', ['sabiduria', 'nobleza', 'virtud', 'maldad', 'audacia']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pruebas_eleccion');
    }
};
