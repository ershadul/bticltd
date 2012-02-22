# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'NewsTranslation'
        db.create_table('news_news_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['news.News'])),
        ))
        db.send_create_signal('news', ['NewsTranslation'])

        # Adding unique constraint on 'NewsTranslation', fields ['language_code', 'master']
        db.create_unique('news_news_translation', ['language_code', 'master_id'])

        # Adding model 'News'
        db.create_table('news_news', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2012, 2, 10, 23, 21, 8, 771906))),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('image_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True, blank=True)),
            ('video', self.gf('django.db.models.fields.files.FileField')(max_length=100, null=True, blank=True)),
            ('video_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True, blank=True)),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(default=1, null=True, blank=True)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('show_on_homepage', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('news', ['News'])


    def backwards(self, orm):
        
        # Removing unique constraint on 'NewsTranslation', fields ['language_code', 'master']
        db.delete_unique('news_news_translation', ['language_code', 'master_id'])

        # Deleting model 'NewsTranslation'
        db.delete_table('news_news_translation')

        # Deleting model 'News'
        db.delete_table('news_news')


    models = {
        'news.news': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'News'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 2, 10, 23, 21, 8, 771906)'}),
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
        'news.newstranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'NewsTranslation', 'db_table': "'news_news_translation'"},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['news.News']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['news']
