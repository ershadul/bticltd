import os
import subprocess
import time

# django imports
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render_to_response
from django.conf import settings


class PDFHttpResponse(object):
    def process_response(self, request, response):
        if request.GET.get('pdf', '0') == '1':
            content = response.content
            content = content.replace('src="/media', 'src="../')
            content = content.replace('href="/media', 'href="../')
            filename = request.get_full_path().replace('?pdf=1', '').replace('/', '_').strip('_')
            if not filename:
                filename = 'home-'
            ROOT_FOLDER =  getattr(settings, "MEDIA_ROOT")
            temp_html_file_name = filename + '-' + str(time.time()) +  '.html'
            full_temp_html_file_name = ROOT_FOLDER +\
                                       "/downloads/" + temp_html_file_name
            file = open(full_temp_html_file_name, 'w')
            file.write(content)
            file.close()
            command_args = '/usr/local/bin/wkhtmltopdf --page-size B3 ' +\
                    full_temp_html_file_name + ' -'
            popen = subprocess.Popen(command_args,
                                     bufsize=4096,
                                     stdout=subprocess.PIPE,
                                     stderr=subprocess.PIPE,
                                     shell=True)
            pdf_contents = popen.stdout.read()
            popen.wait()
            os.remove(full_temp_html_file_name)
            response = HttpResponse(pdf_contents, mimetype='application/pdf')
            response['Content-Disposition'] = 'filename=%s.pdf' % filename
            return response
        return response

class DefaultLanguageMiddleware(object):
    def process_request(self, request):
        lang_path = request.path.split('/')[1]
        if lang_path == 'media' or lang_path == 'opinions':
            return None
        if lang_path == '' or lang_path not in ['en', 'ar']:
            language = request.COOKIES.get('django_language', 'ar')
            return HttpResponseRedirect('/%s%s' % (language, request.path))
