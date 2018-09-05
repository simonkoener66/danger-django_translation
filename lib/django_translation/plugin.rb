module Danger
  # This danger plugin checks if .po translation files included in PR are up-to-date.
  # It's done by running `makemessages` django command first and then see if git diff
  # includes any .po files. If so, it means .po files are outdated and build process
  # should be blocked.
  #
  class DangerDjangoTranslation < Plugin
    def warn_on_django_po_difference
      system('python manage.py makemessages -e html -e py -e pug -e txt -e md -l en-us')

      if diff_for_file('django.po')
        fail 'django.po translation files are outdated. Please run makemessages before submitting PR.'
      end
    end
  end
end
