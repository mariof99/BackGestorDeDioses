<?php

use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\EnviarCorreo;
use App\Http\Controllers\HadesController;
use App\Http\Controllers\HermesController;
use App\Http\Controllers\HumanoController;
use App\Http\Controllers\InfoController;
use App\Http\Controllers\PruebasController;
use App\Http\Controllers\UserController;

//use App\Http\Controllers\API\RegisterController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/users/login', [AuthController::class, 'login']);
Route::post('/users/logout', [AuthController::class, 'logout']);
Route::post('/users/register', [AuthController::class, 'register']);
Route::post('enviarCorreo', [EnviarCorreo::class, 'enviarCorreo']);
Route::get('/users/activarHumano/{id}',[UserController::class, 'activarHumano']);

Route::controller(InfoController::class)->prefix('cosa')->group(function() {

    Route::get('getdestino/{id}', 'getDestino');
    Route::put('updatedestino/{id}', 'updateDestino');
    Route::get('getcaracteristicas/{id}', 'getCaracteristicas');
    Route::put('updatecaracteristicas/{id}', 'updateCaracteristicas');
    Route::put('updatenombre/{id}', 'updateNombre');
    Route::get('gethumanos/{idDios}', 'getHumanosVivos');
    Route::put('updateparamsgenerales/{id}', 'updateParamsGenerales');
    Route::post('crearhumanodios/{id}', 'crearHumanoDios');
});

Route::controller(PruebasController::class)->prefix('pruebas')->group(function() {
    Route::post('insertpruebaeleccion', 'insertPruebaEleccion');
    Route::post('insertpruebapuntual', 'insertPruebaPuntual');
    Route::post('insertpruebaresplibre', 'insertPruebaRespLibre');
    Route::post('insertpruebavaloracion', 'insertPruebaValoracion');
    Route::get('getpruebas', 'getPruebas');
    Route::get('getpruebashumano/{id}', 'getPruebasHumano');
    Route::get('gethumanosasig/{id}', 'getHumanosAsig');
    Route::put('updatepruebaeleccion/{id}', 'updatePruebaEleccion');
    Route::put('updatepruebapuntual/{id}', 'updatePruebaPuntual');
    Route::post('asignarprueba', 'asignarPrueba');
    Route::post('pasarpruebapuntual/{id}', 'pasarPruebaPuntual');
    Route::post('pasarpruebaresplibre/{id}', 'pasarPruebaRespLibre');
});

Route::controller(HermesController::class)->prefix('hermes')->group(function() {
    Route::get('getmensajes/{id}', 'getMensajes');
    Route::get('enviarmensaje/{idEnv}', 'enviarMensaje');
});

Route::controller(HadesController::class)->middleware(['midHades'])->prefix('hades')->group(function() {
    Route::delete('matarhumano/{id}', 'matarHumano');
    Route::delete('matarhumanosaleatorio/', 'matarHumanosAleatorio');
    Route::get('getmuertos/', 'getMuertos');
});