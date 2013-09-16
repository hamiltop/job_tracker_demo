# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Job extends Backbone.Model
  urlRoot: "/jobs"

class Jobs extends Backbone.Collection
  url: "/jobs.json"
  model: Job

class JobsView extends Backbone.View
  initialize: ->
    @collection.on "change", @render, @

  render: (job)->
    console.log "#{job.get("id")} was modified" if job
    @$el.html("")
    @collection.each (job) =>
      @$el.append("<li>#{job.get('company')}</li>")

$ ->
  window.jobs = new Jobs
  jobs.fetch
    success: ->
      window.jobs_view = new JobsView
        collection: jobs
        el: $("#jobs")[0]
      window.jobs_view.render()
