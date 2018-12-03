<footer id="footer">
    <div id="inner-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12 widget">
                    <h3>{{ config('app.name') }}</h3>
                    <p>Sebuah sistem informasi yang memudahkan anda untuk berbelanja menggunakan saldo dari tabungan yang anda miliki di Kuliah Ku.</p>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12 widget">
                    <h3>Alamat Kami</h3>
                    <ul class="contact-list">
                        <li><strong>{{ config('app.name') }}</strong></li>
                        <li>Universitas Sebelas Maret</li>
                        <li>Jebres, Surakarta, Jawa Tengah</li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12 widget">
                    <h3>Jam Kerja</h3>
                    <ul class="contact-list">
                        <li>Senin - Kamis : 09.00 - 17.00 WIB</li>
                        <li>Jumat         : 09.00 - 15.00 WIB</li>
                    </ul>
                </div>
                <div class="clearfix visible-sm"></div>
            </div>{{-- End .row --}}
        </div>{{-- End .container --}}
    </div>{{-- End #inner-footer --}}
    <div id="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-7 col-xs-12 footer-social-links-container">
                    <ul class="social-links clearfix">
                        <li><a href="https://www.facebook.com/KuliahKu" class="social-icon icon-facebook"></a></li>
                        <li><a href="mailto:kuliahku@gmail.com" target="_top" class="social-icon icon-email"></a></li>
                    </ul>
                </div>{{-- End .col-md-7 --}}
                <div class="col-md-5 col-sm-5 col-xs-12 footer-text-container">
                    <p>&copy; {{ Carbon\Carbon::now()->year }} {{ config('app.name') }}&trade; | Developed by Kuliah-Ku</p>
                </div>{{-- End .col-md-5 --}}
            </div>{{-- End .row --}}
        </div>{{-- End .container --}}
    </div>{{-- End #footer-bottom --}}
</footer>{{-- End #footer --}}