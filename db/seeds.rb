# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Agent.create(first_name: 'Harry', last_name: 'Potter')
Agent.create(first_name: 'Mary', last_name: 'White')
Agent.create(first_name: 'John', last_name: 'Peterson')
Contact.create(agent_id: 1, contact_detail: '886-2-23414354', default: false)
Contact.create(agent_id: 1, contact_detail: '886-2-77002341', default: false)
Contact.create(agent_id: 1, contact_detail: '886-2-34520934', default: true)
Contact.create(agent_id: 2, contact_detail: '886-3-43250956', default: false)
Contact.create(agent_id: 2, contact_detail: '886-3-78734509', default: true)
Contact.create(agent_id: 2, contact_detail: '886-3-34887345', default: false)
Contact.create(agent_id: 3, contact_detail: '886-6-45998342', default: true)
Contact.create(agent_id: 3, contact_detail: '886-6-99088374', default: false)
Contact.create(agent_id: 3, contact_detail: '886-6-43234948', default: false)
Contact.create(agent_id: 3, contact_detail: '886-6-42093432', default: false)