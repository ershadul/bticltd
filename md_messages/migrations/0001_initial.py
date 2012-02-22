# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'MessageTranslation'
        db.create_table('md_messages_message_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['md_messages.Message'])),
        ))
        db.send_create_signal('md_messages', ['MessageTranslation'])

        # Adding unique constraint on 'MessageTranslation', fields ['language_code', 'master']
        db.create_unique('md_messages_message_translation', ['language_code', 'master_id'])

        # Adding model 'Message'
        db.create_table('md_messages_message', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2012, 2, 13, 7, 9, 23, 686537))),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('image_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True, blank=True)),
            ('video', self.gf('django.db.models.fields.files.FileField')(max_length=100, null=True, blank=True)),
            ('video_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True, blank=True)),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(default=1, null=True, blank=True)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('show_on_homepage', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('md_messages', ['Message'])


    def backwards(self, orm):
        
        # Removing unique constraint on 'MessageTranslation', fields ['language_code', 'master']
        db.delete_unique('md_messages_message_translation', ['language_code', 'master_id'])

        # Deleting model 'MessageTranslation'
        db.delete_table('md_messages_message_translation')

        # Deleting model 'Message'
        db.delete_table('md_messages_message')


    models = {
        'md_messages.message': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Message'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 2, 13, 7, 9, 23, 686537)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'image_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'show_on_homepage': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'sort_order': ('django.db.models.fields.IntegerField', [], {'default': '1', 'null': 'True', 'blank': 'True'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'video': ('django.db.models.fields.files.FileField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'video_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'})
        },
        'md_messages.messagetranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'MessageTranslation', 'db_table': "'md_messages_message_translation'"},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['md_messages.Message']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['md_messages']
