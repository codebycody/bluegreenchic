class StoresController < ApplicationController
	before_action :admin_only, only: [:create, :destroy, :edit]
end