<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
            <a href="javascript:void(0);" class="bars"></a>   
            @if(Request::segment(1) == 'sistem') 
            <a class="navbar-brand" href="/{{ Request::segment(1) }}">{{ config('app.name') }} - Sistem </a>  
            @elseif(Request::segment(1) == 'bank') 
            <a class="navbar-brand" href="/{{ Request::segment(1) }}">{{ config('app.name') }} - Koperasi Ku </a>  
            @elseif(Request::segment(1) == 'koperasi') 
            <a class="navbar-brand" href="/{{ Request::segment(1) }}">{{ config('app.name') }} - Usaha Ku </a>
            @elseif(Request::segment(1) == 'nasabah') 
            <a class="navbar-brand" href="/{{ Request::segment(1) }}">{{ config('app.name') }} - Nasabah </a>
            @endif
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                @include('layouts.partials.adminbsb.notification')
                <li><a href="/" title="Kembali ke Beranda"><i class="material-icons">home</i></a></li>
                {{-- <li><a href="javascript:void(0);" class="js-search" data-close="true"><i class="material-icons">search</i></a></li> --}}
            </ul>
        </div>
    </div>
</nav>

// {{ ucfirst(Request::segment(1)) }}