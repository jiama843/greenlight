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

class Admin::SessionsController < Admin::AdminController
  # GET /admin/session/end
  def destroy
    session.delete(:admin_session_id)
    redirect_to admin_manage_users_path
  end

  # POST /admin/session/start
  def create
    user = User.find_by(email: params[:email])
    room = Room.find_by(id: user.room_id)

    session[:admin_session_id] = user.id
    redirect_to admin_room_path(room_uid: room.uid)
  end
end