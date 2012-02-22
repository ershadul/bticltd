# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'LocationTranslation'
        db.create_table('branches_location_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255, null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['branches.Location'])),
        ))
        db.send_create_signal('branches', ['LocationTranslation'])

        # Adding unique constraint on 'LocationTranslation', fields ['language_code', 'master']
        db.create_unique('branches_location_translation', ['language_code', 'master_id'])

        # Adding model 'Location'
        db.create_table('branches_location', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2012, 2, 15, 19, 56, 47, 518038))),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('parent', self.gf('django.db.models.fields.related.ForeignKey')(blank=True, related_name='children', null=True, to=orm['branches.Location'])),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal('branches', ['Location'])

        # Adding model 'BranchTranslation'
        db.create_table('branches_branch_translation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('description', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('address', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('contact', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('language_code', self.gf('django.db.models.fields.CharField')(db_index=True, max_length=15, blank=True)),
            ('master', self.gf('django.db.models.fields.related.ForeignKey')(related_name='translations', to=orm['branches.Branch'])),
        ))
        db.send_create_signal('branches', ['BranchTranslation'])

        # Adding unique constraint on 'BranchTranslation', fields ['language_code', 'master']
        db.create_unique('branches_branch_translation', ['language_code', 'master_id'])

        # Adding model 'Branch'
        db.create_table('branches_branch', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2012, 2, 15, 19, 56, 47, 519398))),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['branches.Location'])),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal('branches', ['Branch'])


    def backwards(self, orm):
        
        # Removing unique constraint on 'BranchTranslation', fields ['language_code', 'master']
        db.delete_unique('branches_branch_translation', ['language_code', 'master_id'])

        # Removing unique constraint on 'LocationTranslation', fields ['language_code', 'master']
        db.delete_unique('branches_location_translation', ['language_code', 'master_id'])

        # Deleting model 'LocationTranslation'
        db.delete_table('branches_location_translation')

        # Deleting model 'Location'
        db.delete_table('branches_location')

        # Deleting model 'BranchTranslation'
        db.delete_table('branches_branch_translation')

        # Deleting model 'Branch'
        db.delete_table('branches_branch')


    models = {
        'branches.branch': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Branch'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 2, 15, 19, 56, 47, 519398)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['branches.Location']"}),
            'sort_order': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'branches.branchtranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'BranchTranslation', 'db_table': "'branches_branch_translation'"},
            'address': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'contact': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['branches.Branch']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'branches.location': {
            'Meta': {'ordering': "('sort_order',)", 'object_name': 'Location'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 2, 15, 19, 56, 47, 518038)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'blank': 'True', 'related_name': "'children'", 'null': 'True', 'to': "orm['branches.Location']"}),
            'sort_order': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'branches.locationtranslation': {
            'Meta': {'ordering': "('language_code',)", 'unique_together': "(('language_code', 'master'),)", 'object_name': 'LocationTranslation', 'db_table': "'branches_location_translation'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language_code': ('django.db.models.fields.CharField', [], {'db_index': 'True', 'max_length': '15', 'blank': 'True'}),
            'master': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'translations'", 'to': "orm['branches.Location']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['branches']
