@extends('admin.layout.auth')

@section('content')
    <div id="form">
        <div class="container">
            <div class="col-lg-8 col-lg-offset-2 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="logo-section text-center">
                            <!-- <link rel="shortcut icon" type="image/png" href="https://schedule.tranxit.co/uploads/9577b9001c6a43c9d993f4faac9ceb97c7711582.jpg"> -->
                            <img src="http://borakh.aapbd.com/uploads/fac0a8905536dd0decafb9f64232d373a47407ca.png" alt="">
                        </div>
                    </div>
                </div>
                <div id="userform">

                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li class="active"><a href="#signup" role="tab" data-toggle="tab" aria-expanded="false">Admin</a></li>
                        <li class=""><a href="#dispatcher" role="tab" data-toggle="tab" aria-expanded="false">Dispatcher</a></li>
                        <li class=""><a href="#fleet" role="tab" data-toggle="tab" aria-expanded="true">Fleet</a></li>
                        <li class=""><a href="#account" role="tab" data-toggle="tab" aria-expanded="false">Accountant</a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="signup">
                            <h2 class="text-uppercase text-center"> Sign In</h2>
                            <form id="signup" role="form" method="POST" action="{{ url('/admin/login') }}">
                               
                                <input type="hidden" name="_token" class="_token" value="{{ csrf_token() }}">
                                <div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                                    <label class="active">Super Administrator E-mail<span class="req">*</span></label>
                                    <input type="email" name="email" class="form-control" id="email" required=""  autocomplete="off" placeholder="@lang('admin.email')" value="admin@aapbd.com">
                                    @if ($errors->has('email'))
                                        <span class="help-block" style="margin-left: 55px;color: red;">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                    @endif
                                </div>

                                <div class="form-group {{ $errors->has('password') ? ' has-error' : '' }}">
                                    <label class="active"> Password<span class="req"></span></label>
                                    <input type="password" name="password" class="form-control" required=""  id="password" autocomplete="off" placeholder="@lang('admin.password') *" value="123456">
                                    @if ($errors->has('password'))
                                        <span class="help-block" style="margin-left: 55px;color: red;">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                    @endif
                                </div>
                                <div class="mrgn-30-top" style="margin-bottom: 20px">
                                    <button type="submit" class="btn btn-larger btn-block"> lOG IN</button>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="details">
                                        <h4 class="text-captilize text-left">Using below detail for demo version</h4>
                                        <h5><strong>User Name : </strong><span>admin@aapbd.com</span></h5>
                                        <h5><strong>Password  : </strong><span>123456</span></h5>
                                        <p>Super Administrator can manage whole system and other user's rights too.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="dispatcher">
                            <h2 class="text-uppercase text-center">Sign in</h2>
                            <form id="login" role="form" method="POST" action="{{ url('/dispatcher/login') }}">
                                {{ csrf_field() }}
                                <div class="form-group">
                                    <label class="active">Dispatcher Administrator E-mail<span class="req">*</span> </label>
                                    <input type="email" name="email" class="form-control" id="email" required="" data-validation-required-message="Please enter your email address." autocomplete="off" value="dispatcher@demo.com">
                                </div>
                                <div class="form-group">
                                    <label class="active"> Password<span class="req">*</span> </label>
                                    <input type="password" name="password" class="form-control" id="password" required="" data-validation-required-message="Please enter your password" autocomplete="off" value="123456">
                                </div>
                                <div class="mrgn-30-top">
                                    <button type="submit" class="btn btn-larger btn-block"> Log in</button>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="details">
                                        <h4 class="text-captilize text-left">Using below detail for demo version</h4>
                                        <h5><strong>User Name : </strong><span>dispatcher@demo.com</span></h5>
                                        <h5><strong>Password  : </strong><span>123456</span></h5>
                                        <p>Super Administrator can manage whole system and other user's rights too.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Fleet -->
                        <div class="tab-pane fade in" id="fleet">
                            <h2 class="text-uppercase text-center">Sign In</h2>
                            <form id="login" role="form" method="POST" action="{{ url('/fleet/login') }}">
                                {{ csrf_field() }}
                                <div class="form-group">
                                    <label class="active">Fleet Administrator E-mail<span class="req">*</span> </label>
                                    <input type="email" name="email" class="form-control" id="email" required="" data-validation-required-message="Please enter your email address." autocomplete="off" value="fleet@demo.com">
                                </div>
                                <div class="form-group">
                                    <label class="active"> Password<span class="req">*</span> </label>
                                    <input type="password" name="password" class="form-control" id="password" required="" data-validation-required-message="Please enter your password" autocomplete="off" value="123456">
                                </div>
                                <div class="mrgn-30-top">
                                    <button type="submit" class="btn btn-larger btn-block"> Log in</button>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="details">
                                        <h4 class="text-captilize text-left">Using below detail for demo version</h4>
                                        <h5><strong>User Name : </strong><span>fleet@demo.com</span></h5>
                                        <h5><strong>Password  : </strong><span>123456</span></h5>
                                        <p>Super Administrator can manage whole system and other user's rights too.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Fleet -->
                        <div class="tab-pane fade" id="account">
                            <h2 class="text-uppercase text-center">Sign In</h2>
                            <form id="login" role="form" method="POST" action="{{ url('/account/login') }}">
                                {{ csrf_field() }}
                                <div class="form-group">
                                    <label class="active">Account Administrator E-mail<span class="req">*</span> </label>
                                    <input type="email" name="email" class="form-control" id="email" required="" data-validation-required-message="Please enter your email address." autocomplete="off" value="account@demo.com">
                                </div>
                                <div class="form-group">
                                    <label class="active"> Password<span class="req">*</span> </label>
                                    <input type="password" name="password" class="form-control" id="password" required="" data-validation-required-message="Please enter your password" autocomplete="off" value="123456">
                                </div>
                                <div class="mrgn-30-top">
                                    <button type="submit" class="btn btn-larger btn-block"> Log in</button>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="details">
                                        <h4 class="text-captilize text-left">Using below detail for demo version</h4>
                                        <h5><strong>User Name : </strong><span>account@demo.com</span></h5>
                                        <h5><strong>Password  : </strong><span>123456</span></h5>
                                        <p>Super Administrator can manage whole system and other user's rights too.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
        (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src='https://embed.tawk.to/5bbbc2f6b033e9743d02ca28/default';
            s1.charset='UTF-8';
            s1.setAttribute('crossorigin','*');
            s0.parentNode.insertBefore(s1,s0);
        })();
    </script>
    <!--End of Tawk.to Script-->

    <script>
        $('#form').find('input, textarea').on('keyup blur focus', function (e) {

            var $this = $(this),
                label = $this.prev('label');

            if (e.type === 'keyup') {
                if ($this.val() === '') {
                    label.removeClass('active highlight');
                } else {
                    label.addClass('active highlight');
                }
            } else if (e.type === 'blur') {
                if( $this.val() === '' ) {
                    label.removeClass('active highlight');
                } else {
                    label.removeClass('highlight');
                }
            } else if (e.type === 'focus') {

                if( $this.val() === '' ) {
                    label.removeClass('highlight');
                }
                else if( $this.val() !== '' ) {
                    label.addClass('highlight');
                }
            }

        });

        $('.tab a').on('click', function (e) {

            e.preventDefault();

            $(this).parent().addClass('active');
            $(this).parent().siblings().removeClass('active');

            target = $(this).attr('href');

            $('.tab-content > div').not(target).hide();

            $(target).fadeIn(800);

        });
    </script>

@endsection
