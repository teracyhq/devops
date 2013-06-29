=====================================
How to start develop a Python project
=====================================

To develop a python project, https://github.com/teracy-official/teracy project template should be your starting point. Follow these instruction steps below to start a sample project named ``teracy-sample``.

1. Create a python virtual environment
::
    $ mkvirtualenv teracy-sample

After this command, you should be in the virtual environment by seeing every command line starting with: ``(teracy-sample)``

You can ``$ which python`` to see where ``python`` is located now.

2. Create ``teracy-sample`` project
::
    $ cd ~/workspace/$USER
    $ mkdir teracy-sample
    $ cd teracy-sample
    $ git init
    $ git remote add teracy git@github.com:teracy-official/teracy.git
    $ git fetch
    $ git merge teracy/master
    $ pip install -r requirements/dev.txt
    $ chmod +x manage.py
    $ ./manage.py syncdb
    $ ./manage.py runserver

You should see the similar following content:
::
    Validating models...

    0 errors found
    June 29, 2013 - 01:05:00
    Django version 1.5.1, using settings 'settings.dev'
    Development server is running at http://127.0.0.1:8000/
    Quit the server with CONTROL-C.

Try to open http://127.0.0.1:8000/ on your browser, you will get a 404 error and this is totally normal. We will get it work by next step.

When ``$ ./manage.py syncdb```, you're prompted to create a super user account and you could you that account to access admin page at http://127.0.0.1:8000/admin

Note that you should open a new terminal for executing more commands as the current tab is used to run ``teracy-sample`` project already.

3. Create ``sample`` application.

A specific django application should be put under ``apps`` directory. We're going to create ``sample`` application:
::
    $ cd apps
    $ ../manage.py startapp sample

Add `sample` application to ``INSTALLED_APPS`` on ``settings/dev.py``:
::
    INSTALLED_APPS += (
        'django.contrib.admin',
        'debug_toolbar',
        'compressor',
        'teracy.html5boilerplate',
        'apps.sample',
    ) 

Create ``home.html`` template under ``apps/sample/templates/sample`` directory with following content:
::
    {% extends 'teracy/base.html' %}

    {% block body_content %}
        <h1>Hello World!</h1>
    {% endblock %}

Add ``HomeTemplateView`` to ``apps/sample/views.py``:
::
    from django.views.generic import TemplateView


    class HomeTemplateView(TemplateView):
        template_name = 'sample/home.html'

Create ``apps/sample/urls.py`` and configure ``HomeTemplateView`` with following content:
::
    from django.conf.urls import url, patterns

    from apps.sample.views import HomeTemplateView


    urlpatterns = patterns(
        '',
        url(r'^$', HomeTemplateView.as_view(), name='sample_home'),
    )

Configure the root url on ``urls/dev.py`` by adding the following content:
::
    urlpatterns += (
        url(r'', include('apps.sample.urls')),
    )  

The server could be stopped as there are errors at the steps above, so you need to start it again ``./manage.py runserver``, the server should be started without any error. You can access http://127.0.0.1:8000 now and you should see ``Hello World!`` page instead of the 404 error page.


Congratulations, you've just created a django application and make it work even it does nothing other than "Hello World!" page. You should now learn Django by developing many more applications for this project by adapting Django tutorials: https://docs.djangoproject.com/en/1.5/



