@extends('layouts.venedor')

@section('htmlheader_title', ucfirst(Request::segment(1)))

@push('breadcrumbs')
<div id="breadcrumb-container">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Beranda</a></li>
            <li class="active">{{ ucfirst(Request::segment(1)) }}</li>
        </ul>
    </div>
</div>
@endpush

@section('main-content')
@include('flash::message')
<div class="lg-margin"></div>{{-- Space --}}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 main-content">
                    <div class="lg-margin"></div>{{-- space --}}
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <header class="content-title">
                                <h2 class="title">Mau Berdonasi?</h2>
                            </header>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Anda dapat berdonasi melalui akun kami ......
                                <br>
                                <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nantinya sistem informasi ini mampu memfasilitasi transaksi belanja yang dilakukan oleh nasabah yang didukung dengan penggunaan sistem berbasis web sehingga memudahkan para nasabah dalam berbelanja barang kebutuhan sehari-hari. -->
                            </p>

                            <!-- form donasi -->    
                            <form id="donation" method="POST">
                                <div>
                                    <span class="input-group-addon"><span class="input-icon input-icon-message"></span><span class="input-text">Jumlah Donasi</span></span>
                                    <input type="text" id="phone_number" name="phone_number" data-format="dddd-dddd-ddddd"  class="form-control input-lg bfh-phone" placeholder="Jumlah donasi">
                                </div>
                                @if ($errors->has('phone_number'))
                                <span class="help-block">{{ $errors->first('phone_number') }}</span>
                                <div class="sm-margin"></div>{{-- space --}}
                                @endif
                            </form>


                        </div>{{-- End .col-md-6 --}}
                        <!-- <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="sm-margin visible-xs"></div>{{-- space --}}
                            <img src="{{ asset('img/logo.png') }}" alt="Belanja Sampah" class="img-responsive">
                        </div>{{-- End .col-md-5 --}} -->
                    </div>{{-- End .row --}}
                    <div class="xlg-margin"></div>{{-- space --}}
                </div>{{-- End .col-md-12 --}}
            </div>{{-- End .row --}}
        </div>{{-- End .col-md-12 --}}
    </div>{{-- End .row --}}
</div>{{-- End .container --}}
@endsection