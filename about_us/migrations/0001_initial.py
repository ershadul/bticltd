# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'EmployeeTranslation'
        db.create_table('about_us_employee_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('contact_number', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('tag_line', self.gf('django.db.models.fields.CharField')(max_length=75, null=True, blank=True)),
            ('designation', self.gf('django.db.models.fields.CharField')(max_length=75, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['about_us.Employee'])),
        ))
        db.send_create_signal('about_us', ['EmployeeTranslation'])

        # Adding unique constraint on 'EmployeeTranslation', fields ['language_code', 'master']
        db.create_unique('about_us_employee_translation', ['language_code', 'master_id'])

        # Adding model 'Employee'
        db.create_table('about_us_employee', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('employee_type', self.gf('django.db.models.fields.CharField')(max_length=75, db_index=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2012, 2, 14, 14, 23, 43, 925326))),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(default=1, null=True, blank=True)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75, null=True, blank=True)),
        ))
        db.send_create_signal('about_us', ['Employee'])


    def backwards(self, orm):
        
        # Removing unique constraint on 'EmployeeTranslation', fields ['language_code', 'master']
        db.delete_unique('about_us_employee_translation', ['language_code', 'master_id'])

        # Deleting model 'EmployeeTranslation'
        db.delete_table('about_us_employee_translation')

        # Deleting model 'Employee'
        db.delete_table('about_us_employee')


    models = {
        'about_us.employee': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Employee'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 2, 14, 14, 23, 43, 925326)'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'}),
            'employee_type': ('django.db.models.fields.CharField', [], {'max_length': '75', 'db_index': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sort_order': ('django.db.models.fields.IntegerField', [], {'default': '1', 'null': 'True', 'blank': 'True'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'about_us.employeetranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'EmployeeTranslation', 'db_table': "'about_us_employee_translation'"},
            'contact_number': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'designation': ('django.db.models.fields.CharField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['about_us.Employee']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'tag_line': ('django.db.models.fields.CharField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['about_us']
