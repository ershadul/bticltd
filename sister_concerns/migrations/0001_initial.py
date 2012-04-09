# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'SisterConcernTranslation'
        db.create_table('sister_concerns_sisterconcern_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('slogan', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['sister_concerns.SisterConcern'])),
        ))
        db.send_create_signal('sister_concerns', ['SisterConcernTranslation'])

        # Adding unique constraint on 'SisterConcernTranslation', fields ['language_code', 'master']
        db.create_unique('sister_concerns_sisterconcern_translation', ['language_code', 'master_id'])

        # Adding model 'SisterConcern'
        db.create_table('sister_concerns_sisterconcern', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_dt', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_dt', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('sort_order', self.gf('django.db.models.fields.SmallIntegerField')(default=1, db_index=True)),
            ('logo', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('sister_concerns', ['SisterConcern'])

        # Adding model 'ProjectTranslation'
        db.create_table('sister_concerns_project_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('slogan', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(default='', null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['sister_concerns.Project'])),
        ))
        db.send_create_signal('sister_concerns', ['ProjectTranslation'])

        # Adding unique constraint on 'ProjectTranslation', fields ['language_code', 'master']
        db.create_unique('sister_concerns_project_translation', ['language_code', 'master_id'])

        # Adding model 'Project'
        db.create_table('sister_concerns_project', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('sister_concern', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['sister_concerns.SisterConcern'])),
            ('sort_order', self.gf('django.db.models.fields.SmallIntegerField')(default=1, db_index=True)),
            ('show_on_homepage', self.gf('django.db.models.fields.BooleanField')(default=True, db_index=True)),
            ('logo', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('sister_concerns', ['Project'])

        # Adding model 'ProductTranslation'
        db.create_table('sister_concerns_product_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('slogan', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(default='', null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['sister_concerns.Product'])),
        ))
        db.send_create_signal('sister_concerns', ['ProductTranslation'])

        # Adding unique constraint on 'ProductTranslation', fields ['language_code', 'master']
        db.create_unique('sister_concerns_product_translation', ['language_code', 'master_id'])

        # Adding model 'Product'
        db.create_table('sister_concerns_product', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('sister_concern', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['sister_concerns.SisterConcern'])),
            ('sort_order', self.gf('django.db.models.fields.SmallIntegerField')(default=1, db_index=True)),
            ('show_on_homepage', self.gf('django.db.models.fields.BooleanField')(default=True, db_index=True)),
            ('logo', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('sister_concerns', ['Product'])


    def backwards(self, orm):
        
        # Removing unique constraint on 'ProductTranslation', fields ['language_code', 'master']
        db.delete_unique('sister_concerns_product_translation', ['language_code', 'master_id'])

        # Removing unique constraint on 'ProjectTranslation', fields ['language_code', 'master']
        db.delete_unique('sister_concerns_project_translation', ['language_code', 'master_id'])

        # Removing unique constraint on 'SisterConcernTranslation', fields ['language_code', 'master']
        db.delete_unique('sister_concerns_sisterconcern_translation', ['language_code', 'master_id'])

        # Deleting model 'SisterConcernTranslation'
        db.delete_table('sister_concerns_sisterconcern_translation')

        # Deleting model 'SisterConcern'
        db.delete_table('sister_concerns_sisterconcern')

        # Deleting model 'ProjectTranslation'
        db.delete_table('sister_concerns_project_translation')

        # Deleting model 'Project'
        db.delete_table('sister_concerns_project')

        # Deleting model 'ProductTranslation'
        db.delete_table('sister_concerns_product_translation')

        # Deleting model 'Product'
        db.delete_table('sister_concerns_product')


    models = {
        'sister_concerns.product': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Product'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'show_on_homepage': ('django.db.models.fields.BooleanField', [], {'default': 'True', 'db_index': 'True'}),
            'sister_concern': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['sister_concerns.SisterConcern']"}),
            'sort_order': ('django.db.models.fields.SmallIntegerField', [], {'default': '1', 'db_index': 'True'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'sister_concerns.producttranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'ProductTranslation', 'db_table': "'sister_concerns_product_translation'"},
            'description': ('django.db.models.fields.TextField', [], {'default': "''", 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['sister_concerns.Product']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'slogan': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        },
        'sister_concerns.project': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Project'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'show_on_homepage': ('django.db.models.fields.BooleanField', [], {'default': 'True', 'db_index': 'True'}),
            'sister_concern': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['sister_concerns.SisterConcern']"}),
            'sort_order': ('django.db.models.fields.SmallIntegerField', [], {'default': '1', 'db_index': 'True'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'sister_concerns.projecttranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'ProjectTranslation', 'db_table': "'sister_concerns_project_translation'"},
            'description': ('django.db.models.fields.TextField', [], {'default': "''", 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['sister_concerns.Project']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'slogan': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        },
        'sister_concerns.sisterconcern': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'SisterConcern'},
            'created_dt': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sort_order': ('django.db.models.fields.SmallIntegerField', [], {'default': '1', 'db_index': 'True'}),
            'updated_dt': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'sister_concerns.sisterconcerntranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'SisterConcernTranslation', 'db_table': "'sister_concerns_sisterconcern_translation'"},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['sister_concerns.SisterConcern']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'slogan': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['sister_concerns']
