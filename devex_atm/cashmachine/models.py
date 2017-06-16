# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

import datetime
# Create your models here.
class Cards(models.Model):
    id = models.AutoField(primary_key=True,)
    cardnum = models.CharField(max_length=19)
    password = models.CharField(max_length = 32)
    balance = models.FloatField()
    is_active = models.BooleanField()
    wrong_pass_counter = models.IntegerField()

    def __unicode__(self):
        return '%s %s %s %s %s %s ' % (self.id, self.cardnum, self.password, self.balance, self.is_active, self.wrong_pass_counter)

class AvailableOperations(models.Model):
    id = models.AutoField(primary_key=True, )
    operation_name = models.CharField(max_length=255)
    operation_url = models.CharField(max_length=255)

    def __unicode__(self):
        return '%s %s %s' % (self.id, self.operation_name, self.operation_url)

class OperationsLog(models.Model):
    id = models.AutoField(primary_key=True,)
    card_id = models.ForeignKey('Cards', models.DO_NOTHING, db_column='card_id', blank=True, null=True)
    operation_id = models.ForeignKey('AvailableOperations', models.DO_NOTHING, db_column='operation_id', blank=True, null=True)
    payout = models.FloatField(null=True, default= None)
    time = models.DateTimeField(default=datetime.datetime.now())

    def __unicode__(self):
        return '%s %s %s %s %s ' % (self.id, self.card_id, self.operation_id, self.payout, self.time)
