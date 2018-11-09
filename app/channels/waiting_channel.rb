# frozen_string_literal: true

# BigBlueButton open source conferencing system - http://www.bigbluebutton.org/.
#
# Copyright (c) 2018 BigBlueButton Inc. and by respective authors (see below).
#
# This program is free software; you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free Software
# Foundation; either version 3.0 of the License, or (at your option) any later
# version.
#
# BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.

class WaitingChannel < ApplicationCable::Channel

  def subscribed

    puts ActionCable.server.connections.size
    ActionCable.server.connections.each do |connection|
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    end

    room = Room.find_by!(uid: params[:uid])

    #puts @room.name

    stream_from "#{params[:uid]}_waiting_channel", coder: ActiveSupport::JSON do |channel|
    #stream_for @room, coder: ActiveSupport::JSON do |channel|

      #wait_list ||= []

      # wait_list[:params[:uid]].push(name)

      #type_of_channel = channel.class
      #eval(channel)[:wait_list] ||= []

      #chasdasdasdasd = eval(channel)[:wait_list]

      #channel["wait_list"] ||= []

      #channel += "{\"action\":\"update_list\", \"wait_list\":[]}"
      #channel["wait_list"].push("Hi")
      #puts channel["wait_list"]
      #@room.wait_list.

      watilsit = room.wait_list

      room.update_attributes(wait_list: watilsit.push("hi"))
      room.save
      byebug

      puts "]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]"
      #join_name = params[:join_name]
      ch = channel
      #wait_list.push("HI")#params[:join_name])
      #wl = wait_list
      #ok = @wait_list
      #byebug
      #channel[:wait_list] = channel[:wait_list]params[:join_name]
    end
    #byebug
  end

  def unsubscribed
    # Update params
    # byebug
    room = Room.find_by!(uid: params[:uid])

    room.update_attributes(wait_list: room.wait_list - "hi")
    room.save
    puts room.name + "***************************************************************************"
    #stop_all_streams
  end
end
